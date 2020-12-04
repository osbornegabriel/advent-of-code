require '../helpers'

class PassportScanner
  EYE_COLORS = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

  REQUIRED_FIELDS = {
    "byr" => ->(value){ (1920..2002).include?(value.to_i) },
    "iyr" => ->(value){ (2010..2020).include?(value.to_i) },
    "eyr" => ->(value){ (2020..2030).include?(value.to_i) },
    "hgt" => ->(value){ valid_height?(value) },
    "hcl" => ->(value){ value.match(/^#[0-9a-f]{6}$/) },
    "ecl" => ->(value){ EYE_COLORS.include?(value) },
    "pid" => ->(value){ value.match(/^\d{9}$/) }
  }

  class <<self
    def validate(passport)
      passport_info = scan_passport(passport)

      {
        has_required_fields: has_required_fields?(passport_info),
        is_valid: valid_passport?(passport_info)
      }
    end

    def scan_passport(passport)
      passport.scan(/(\w*):(\S*)/).to_h
    end

    def has_required_fields?(scanned_passport)
      (REQUIRED_FIELDS.keys - scanned_passport.keys).empty?
    end

    def valid_passport?(scanned_passport)
      REQUIRED_FIELDS.each do |field, validation|
        field_info = scanned_passport[field]

        return false if (
          !field_info ||
          !validation.call(field_info)
        )
      end

      true
    end

    private

    def valid_height?(height)
      validate_height(height, "cm", 150, 193) ||
      validate_height(height, "in", 59, 78)
    end

    def validate_height(height_info, unit, min, max)
      match = height_info.match(/^(\d+)#{unit}$/)
      return unless match

      height = match[1].to_i
      height >= min && height <= max
    end
  end
end

passport = ""
complete_passports = 0
valid_passports = 0

Helpers.process_input do |line|
  if (line != "")
    passport += " " + line
  else
    scan_result = PassportScanner.validate(passport)
    complete_passports += 1 if scan_result[:has_required_fields]
    valid_passports += 1 if scan_result[:is_valid]
    passport = ""
  end
end

#Handle final line of input
scan_result = PassportScanner.validate(passport)
complete_passports += 1 if scan_result[:has_required_fields]
valid_passports += 1 if scan_result[:is_valid]

Helpers.print_pretty_answers([
  complete_passports, # => 196
  valid_passports # => 114
])