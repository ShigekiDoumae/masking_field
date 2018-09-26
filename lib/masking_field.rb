require "masking_field/version"
require "masking_field/class_methods"
module MaskingField
  autoload :ClassMethods, "masking_field/class_methods"
  def self.included(base)
    base.extend(ClassMethods)
  end
end
