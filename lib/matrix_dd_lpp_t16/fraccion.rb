
module MatrixDdLppT16
	class Fraccion

	  #Módulo Comparable
	  include Comparable 
	  
	  attr_reader :num, :dem
	  def initialize(num,dem)
		@num, @dem = num, dem
		mcm = gcd(num, dem)
		    @num = num/mcm
		    @dem = dem/mcm
	  end
	  
	  #Calculo del minimo comun multiplo
	  def gcd(u, v)
	     u, v = u.abs, v.abs
	     while v != 0
	       u, v = v, u % v
	     end
	    u
	  end

	  #Convierte a string
	  def to_s
	    "#{@num}/#{@dem}"
	  end

	  
	  def coerce(other)
              [other, self]
          end
	  
	  #Convierte a flotante
	  def to_f()
		@num.to_f/@dem.to_f
	  end
	  
  	  #Suma de fracciones
	  def +(other)
		return Fraccion.new((other.dem * @num) + (@dem * other.num), @dem * other.dem)
	  end

  	  #Multiplicacion de fracciones
	  def *(other)
                return Fraccion.new(@num * other.num, @dem * other.dem)
          end


	end
end
