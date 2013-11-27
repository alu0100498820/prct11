require "./lib/matrix_dd_lpp_t16/matriz.rb"
require "./lib/matrix_dd_lpp_t16/matriz_densa.rb"

module MatrixDdLppT16

  #Matriz Dispersa que hereda de la clase Matriz
  class Matriz_Dispersa < Matriz

    def new_initialize
      @pos = Array.new(@filas)
      for i in 0...@filas
        @pos[i] = {} 
      end
    end

    #Constructor de la clase Matriz Dispersa
    def initialize(filas, columnas)
      super
      new_initialize
    end

    #Creacion matriz dispersa
    def self.copy(matriz)
      obj = new(matriz.filas, matriz.columnas)
      for i in 0...matriz.filas
        for j in 0...matriz.columnas
          val = matriz.get(i,j)
          if(val != 0)
            obj.pos[i][j] = val
            end
        end
      end
      obj
    end

   #Metodo que devuelve el valor del elemento en la posision i,j
   def get(i, j)
      if(@pos[i][j] != nil)
        return @pos[i][j]
      else
        return 0
      end
    end
 
    #Metodo que modifica el valor del elemento en la posicion i,j
    def set(i, j, val)
      if(val == nil or val == 0)
        @pos[i].delete(j)
      else
        @pos[i][j] = val
      end
    end

    #Porcentaje de numeros Nulos
    def num_nulos
       total = @filas*@columnas
       cont = 0

       for i in 0...@filas
         cont += @pos[i].size
       end
       res = total - cont
       res.to_f/total.to_f
     end

    #to_s (Convierte los numeros en una cadena) 
    def to_s
      output = ""
      for i in 0...@filas
        output += "Fila #{i}: "
        @pos[i].sort.each{|k, v| output += "#{k}=>#{v} "}
        output += "\n"
      end
      output
    end

    #Metodo Suma (Suma de dos matrices)
     def +(other)
      c = Matriz_Densa.new(@filas, @columnas)
      0.upto(@filas-1) do |i|
        0.upto(@columnas-1) do |j|
          c.set(i, j, get(i,j) + other.get(i,j))
        end
      end

      if(c.num_nulos > 0.6)
         c = Matriz_Dispersa.copy(c)
      end
      c
    end

    #Metodo Resta (Resta de dos matrices)
    def -(other)
      c = Matriz_Densa.new(@filas, @columnas)
      for i in 0...@filas
        for j in 0...@columnas
          c.set(i, j, get(i,j) - other.get(i,j))
        end
      end
    
      if(c.num_nulos > 0.6)
        c = Matriz_Dispersa.copy(c)
      end
      c
    end

    #Metodo Multiplicacion (Multiplicacion de dos matrices)
     def *(other)
      c = Matriz_Densa.new(@filas, other.columnas)
      0.upto(@filas-1) do |i|
        0.upto(other.columnas-1) do |j|
         0.upto(@columnas-1) do |k|
          c.set(i, j, get(i, k) * other.get(k,j) + c.get(i,j))
        end
      end
    end 

    if(c.num_nulos > 0.6)
      c = Matriz_Dispersa.copy(c)
    end
    c
    end

  end
end
