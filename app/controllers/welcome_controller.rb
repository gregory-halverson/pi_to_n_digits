# from Jeremy Gibbons' spigot algorithm
def pi(digits)
  output = ''
  digit_counter = 0
  q, r, t, k, n, l = 1, 0, 1, 1, 3, 3
  dot = nil

  while digit_counter < digits
    if 4*q+r-t < n*t
      output += n.to_s

      if dot.nil?
        output += '.'
        dot = '.'
      else
        digit_counter += 1
      end

      nr = 10*(r-n*t)
      n = ((10*(3*q+r)) / t) - 10*n
      q *= 10
      r = nr
    else
      nr = (2*q+r) * l
      nn = (q*(7*k+2)+r*l) / (t*l)
      q *= k
      t *= l
      l += 2
      k += 1
      n = nn
      r = nr
    end
  end

  output
end

class WelcomeController < ApplicationController
  def index
    @digits = 10

    @digits = params[:digits].to_i if params[:digits]
    @digits = 1000 if @digits > 1000

    @pi = pi(@digits)
  end
end
