module SolrSearchSanitizer
  module Sanitizer
    BOOLEAN_OPERATOR_REGEXP = /(\sAND\s|\sOR\s|\sNOT\s|\s&&\s|\s!\s|\s\|\|\s)/
    BRACKET_REGEXP = /((\(|\))|(\{|\})|(\[|\]))/
    WILDCARD_REGEXP = /((\*|\?))/
    FUZZY_REGEXP = /[\w|\"](~)[\d]?/
    BOOST_REGEXP = /[\w|\"](\^)[\d]?/
    BOOLEAN_MODIFIER_REGEXP = /(\+|-)[(\w+(\s|\b))|(\".+\")]/
    MISC_REGEXP = //
    
    gm+/(\+|-)^\"+[\s|\b]|\"[^\"+]\"/
    def some_method(query, strict=false)
    end
    def remove_boolean_operators(query)
      query.gsub(BOOLEAN_OPERATOR_REGEXP, '')
    end
    # + - " : \
    def remove_boolean_operators(query)
      query.gsub(BRACKET_REGEXP.union(WILDCARD_REGEXP).union(FUZZY_REGEXP).union(BOOST_REGEXP).union(BOOLEAN_MODIFIER_REGEXP), '')
    end
    
    def escape_special_characters(query)
      query.gsub(/
    end
  end
end 
