module PuppetTheatre
  module Findable
    def find_class(name, mod, path)
      klsname = name.to_s.gsub(/(?:\A|_)./) { |s| s[-1].upcase }.intern
      begin
        mod.const_get(klsname, false)
      rescue NameError
        require [path, name].join('/')
        mod.const_get(klsname, false)
      end
    end
  end
end
