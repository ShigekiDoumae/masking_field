module MaskingField
  module ClassMethods
    def masking_to(*mask_columns)
      gen_options  = mask_columns.select{|cname| cname.instance_of?(Hash) }.flatten.first
      masking_data = gen_mask_data(gen_options||{})

      class_name = self.to_s.classify
      column_names      = Module.const_get(class_name).columns.map(&:name).map(&:to_sym)
      mask_column_names = mask_columns.select{|cname| cname.instance_of?(Symbol) || cname.instance_of?(String) }
      (column_names & mask_column_names).each do|read_column|
        define_method(read_column) do
          masking_data
        end
      end
    end

    def gen_mask_data(options={})
      #文字列が指定されてたらそのまま使う
      return options[:fixed].to_s if options.present? && options[:fixed].present?
      #指定されてなければ作る
      if options[:gen_type]
        return eval("gen_from_#{options[:gen_type]}(#{options[:gen_length]||10})")
      elsif options[:gen_length].to_i > 0
        return "*" * options[:gen_length].to_i
      else
        return "**********"
      end
    end

    def gen_from_lowercase(gen_length=10)
      ("a".."z").to_a.sample(gen_length).join
    end

    def gen_from_uppercase(gen_length=10)
      ("A".."Z").to_a.sample(gen_length).join
    end

    def gen_from_integer(gen_length=10)
      ("A".."Z").to_a.sample(gen_length).join
    end
  end
end
