require "./lib/matrix_dd_lpp_t16/fraccion.rb"


module MatrixDdLppT16
  
  #Clase abstracta Matriz
  class Matriz
    
    #Variable que lee el numero de filas y columnas de la matriz.
    attr_reader :filas, :columnas
    
    #Variable que guarda la posicion
    attr_accessor :pos

    #Constructor de la clase Matriz
    def initialize(filas, columnas)
      #Variable que guarda el numero de filas de la matriz.
      @filas=filas
      #Variable que guarda el numero de columnas de la matriz.       
      @columnas=columnas  
    end
  end
	
  def coerce(other)
        [other, self]
  end
end
