class BaseSearch
  private

  def escape_search_term(term)
    "%#{term.gsub(/\s+/, '%')}%"
  end
end
