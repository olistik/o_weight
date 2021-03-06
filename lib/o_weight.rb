require "o_weight/version"
require 'bigdecimal'
require 'bigdecimal/util'

class OWeight
  UNITS_CONVERSION = {
    milligram: 0.001.to_d,
    centigram: 0.01.to_d,
    decigram: 0.1.to_d,
    gram: 1.to_d,
    dekagram: 10.to_d,
    hectogram: 100.to_d,
    kilogram: 1000.to_d,
    ton: 1000000.to_d
  }

  attr_accessor :value, :unit

  include Comparable

  def initialize(value:, unit: :gram)
    @value = BigDecimal.new(value)
    @unit = unit
  end

  def to_s
    "#{value.to_f} #{formatted_unit}"
  end

  UNITS_CONVERSION.keys.each do |unit|
    define_method("to_#{unit}") do
      to_unit(unit)
    end
  end

  def to_unit(dest_unit)
    dest_value = value * UNITS_CONVERSION[unit] / UNITS_CONVERSION[dest_unit]
    self.class.new(value: dest_value, unit: dest_unit)
  end

  %i[+ - * /].each do |operator|
    define_method(operator) do |operand|
      operation(operator: operator, operand: operand)
    end
  end

  def <=>(operand)
    operand = convert_operand(operand)
    value <=> operand.value
  end

  private

    def formatted_unit
      defined?(I18n) ? I18n.t("weight.units.#{unit}") : unit
    end

    def convert_operand(operand)
      if operand.respond_to?(:to_unit)
        operand.to_unit(unit)
      else
        operand = self.class.new(value: operand, unit: unit)
      end
    end

    def operation(operator:, operand:)
      operand = convert_operand(operand)
      new_value = self.value.send(operator, operand.value)
      self.class.new(value: new_value, unit: unit)
    end
end

OWeight::UNITS_CONVERSION.keys.each do |unit|
  Numeric.class_eval do
    define_method("to_#{unit}") do
      OWeight.new(value: self, unit: unit)
    end
  end
end
