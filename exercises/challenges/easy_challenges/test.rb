LETTER_SCORES = { %w(A, E, I, O, U, L, N, R, S, T) =>	1, %w(D, G)	=> 2,
                    %w(B, C, M, P) => 3, %w(F, H, V, W, Y) =>	4, %w(K) => 5,
                    %w(J, X)	=> 8, %w(Q, Z) => 10 }

  def score(word)
    total_score = 0
    return total_score if word.nil?
      word.upcase.split('') do |char|
      LETTER_SCORES.each do |key, val|
        p char
        p key
        p key.include?(char)
         total_score += val if key.include?(char)
      end
    end

    total_score
  end

  score('a')
