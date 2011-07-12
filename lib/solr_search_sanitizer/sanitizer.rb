module SolrSearchSanitizer
  module Sanitizer
    BOOLEAN_STRING_OPERATOR_REGEXP = /\s(AND)\s|\s(OR)\s)|\s(NOT)\s/
    BOOLEAN_SYMBOL_OPERATOR_REGEXP = /\s(&&)\s|\s(!)\s)|\s(\|\|)\s/
    BRACKET_REGEXP = /((\(|\))|(\{|\})|(\[|\]))/
    WILDCARD_REGEXP = /((\*|\?))/
    FUZZY_REGEXP = /[\w|\"](~)[\d]?/
    BOOST_REGEXP = /[\w|\"](\^)[\d]?/
    BOOLEAN_MODIFIER_REGEXP = /(\+|-)[(\w+(\s|\b))|(\".+\")]/
    MISC_REGEXP = //
    
    ####################
    #
    # All REGEXP definitions match characters or keywords that are part of the Apache Lucene Query Parser Sytntax
    #
    # BOOLEAN_OPERATOR_REGEXP => matches boolean operators on multiple search terms
    # these operators should be removed from a basic query since they do not incorporate
    #
    # BRACKET_REGEXP => matches parentheses and brackets and braces that group search clauses or define range searches
    #
    # WILDCARD_REGEXP => matches ? or * characters in the search that act as single or multiple character wildcards within a search term
    #
    # FUZZY_REGEXP => matches the ~ character at the end of a search term or phrase 
    #
    # BOOST_REGEXP => matches the ^ character at the end of a search term or phrase
    #
    # BOOLEAN_MODIFIER_REGEXP => matches + or - characters at the start of search terms/phrases
    #
    ####################
    
    def escape_boolean_operators(query)
      new_query = new_query.gsub(BOOLEAN_SYMBOL_OPERATOR_REGEXP, '\\\\\1')
    end
    
    def remove_boolean_operators(query)
      new_query = query.gsub(BOOLEAN_STRING_OPERATOR_REGEXP.union(BOOLEAN_SYMBOL_OPERATOR_REGEXP), ' ')
    end
    
    def escape_brackets(query)
    end
    
    def remove_brackets(query)
    end
    
    def escape_wildcards(query)
    end
    
    def remove_wildcards(query)
    end
    
    def escape_fuzzy(query)
    end
    
    def remove_fuzzy(query)
    end
    
    def escape_boost(query)
    end
    
    def remove_boost(query)
    end
    
    def escape_boolean_modifiers(query)
    end
    
    def remove_boolean_modifiers(query)
    end
    def remove_boolean_operators(query)
      query.gsub(BOOLEAN_OPERATOR_REGEXP, '')
    end
    def escape_special_characters(query)
      query.gsub(BRACKEY_REGEXP.union(WILDCARD_REGEXP).union(FUZZY_REGEXP).union(BOOST_REGEXP).union(BOOLEAN_MODIFIER_REGEXP), '\\\\\1'
    end
  end
end
