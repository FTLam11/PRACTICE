class Bob
  def hey(remark)
    return 'Fine. Be that way!' if said_nothing?(remark)
    return 'Whoa, chill out!' if yelled_at?(remark)
    return "Sure." if asked_question?(remark)
    'Whatever.'
  end

  private

  def said_nothing?(remark)
    remark.scan(/\w+/) == []
  end

  def yelled_at?(remark)
    all_caps?(remark) && said_words?(remark)
  end

  def all_caps?(remark)
    remark == remark.upcase
  end

  def said_words?(remark)
    remark.scan(/[a-zA-Z]/) != []
  end

  def asked_question?(remark)
    remark.end_with?("?")
  end
end

# remark == remark.upcase && remark.scan(/\w+/).select { |word| word.length > 1 } != []