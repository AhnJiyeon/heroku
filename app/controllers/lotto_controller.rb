class LottoController < ApplicationController
    def home
        @lotto = (1..45).to_a.sample(6).sort
        
        require 'json'
        require 'net/http'
        source = 'http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo'
        resp = Net::HTTP.get_response(URI.parse(source))
        data = resp.body

        @hash = Hash.new
        @hash = JSON.parse(data)
        
        @lotto2 = Array.new
        
        6.times do |x|
            @lotto2[x] = @hash["drwtNo#{x+1}"]
        
        end
        @lotto3 = Array.new
        
        @lotto.each do |a|
            if @lotto2.include? a
                @lotto3 << a
            end
        end
    end
end