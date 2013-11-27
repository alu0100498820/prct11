require "./lib/matrix_dd_lpp_t16.rb"
include MatrixDdLppT16

describe MatrixDdLppT16::Matriz_Densa do
 
    before :each do
        @m1 = MatrixDdLppT16::Matriz_Densa.new(2,2)
        @m2 = MatrixDdLppT16::Matriz_Densa.new(2,2)
	@m4 = MatrixDdLppT16::Matriz_Densa.new(2,2)
	@m5 = MatrixDdLppT16::Matriz_Densa.new(2,2)
	

        @m1.set(0,0,1)
        @m1.set(0,1,2)
        @m1.set(1,0,3)
        @m1.set(1,1,4)

        @m2.set(0,0,1)
        @m2.set(0,1,2)
        @m2.set(1,0,3)
        @m2.set(1,1,4)

	@m4.set(0,0,Fraccion.new(1,1))
	@m4.set(0,1,1)
        @m4.set(1,0,2)
	@m4.set(1,1,3)

	@m5.set(0,0,Fraccion.new(1,1))
	@m5.set(0,1,1)
        @m5.set(1,0,2)
	@m5.set(1,1,3)
       
	

    end

    describe " # Almacenamiento de matrices. " do
        it " # Debe poderse acceder a los datos almacenados en la matriz " do
            @m1.get(0,0).should eq(1)
            @m1.get(0,1).should eq(2)
        end
        it " # Debe poderse modificar los datos almacenados en la matriz " do
            @m1.set(0,0,5)
            @m1.get(0,0).should eq(5)

            @m1.set(0,1,8)
            @m1.get(0,1).should eq(8)
        end

    end
    describe " # Operaciones con matrices densas. " do
        it " # Sumar dos matrices " do
                @m3 = MatrixDdLppT16::Matriz_Densa.new(2,2)
                @m3.set(0,0,2)
                @m3.set(0,1,4)
                @m3.set(1,0,6)
                @m3.set(1,1,8)

                (@m1+@m2).to_s.should eq(@m3.to_s)
        end

	it "#sumar matrices de fracciones." do
		
		@m6 = MatrixDdLppT16::Matriz_Densa.new(2,2)
                @m6.set(0,0,Fraccion.new(2,1))
                @m6.set(0,1,2)
                @m6.set(1,0,4)
                @m6.set(1,1,6)

                (@m4+@m5).to_s.should eq(@m6.to_s)
	end

        it " # Restar dos matrices " do
                @m3 = MatrixDdLppT16::Matriz_Densa.new(2,2)
                @m3.set(0,0,0)
                @m3.set(0,1,0)
                @m3.set(1,0,0)
                @m3.set(1,1,0)

                (@m2-@m1).to_s.should eq(@m3.to_s)
        end
	it " # Multiplicar dos matrices " do
                @m3 = MatrixDdLppT16::Matriz_Densa.new(2,2)
                @m3.set(0,0,7)
                @m3.set(0,1,10)
                @m3.set(1,0,15)
                @m3.set(1,1,22)

                (@m1*@m2).to_s.should eq(@m3.to_s)
        end
    end
    describe " # max y min " do
        it " # Maximo de una matriz" do
                @m1.max.should == 4
        end
        it " # Minimo de una matriz" do
                @m1.min.should == 1
        end
    end
end

describe MatrixDdLppT16::Matriz_Dispersa do

    before :each do
        @m1 = MatrixDdLppT16::Matriz_Densa.new(3,2)

        @m1.set(0,0,0)
        @m1.set(0,1,0)
        @m1.set(1,0,1)
        @m1.set(1,1,3)
        @m1.set(2,0,0)
        @m1.set(2,1,0)

        @md1 = MatrixDdLppT16::Matriz_Dispersa.copy(@m1)
        @md2 = MatrixDdLppT16::Matriz_Dispersa.new(3,2)

    end

    describe " # Almacenamiento de matrices. " do

        it " # Debe poderse crear matrices dispersas vacias o a partir de matrices densas." do
            MatrixDdLppT16::Matriz_Dispersa.new(5, 5)
            MatrixDdLppT16::Matriz_Dispersa.copy(@m1)
        end
	
	 it " # Modificando los elementos de la matriz dispersa." do
            @md2.set(0,1,1)
            @md2.set(1,0,1)
            @md2.set(1,1,1)
            @md2.set(2,0,1)

            @md1.set(1,1,10)
            @md1.set(1,0,45)
            @md1.get(1,1).should == 10
            @md1.get(1,0).should == 45
        end
    end

    describe " # Operaciones matrices dispersas. " do
        it " # Sumar dos matrices " do
                @md3 = MatrixDdLppT16::Matriz_Dispersa.new(3,2)

                @md3.set(0,0,0)
                @md3.set(0,1,0)
                @md3.set(1,0,1)
                @md3.set(1,1,3)
                @md3.set(2,0,0)
                @md3.set(2,1,0)

                (@md1+@md2).to_s.should eq(@md3.to_s)
        end
        it " # Restar dos matrices " do
                @md3 = MatrixDdLppT16::Matriz_Dispersa.new(3,2)

                @md3.set(0,0,0)
                @md3.set(0,1,0)
                @md3.set(1,0,-1)
                @md3.set(1,1,-3)
                @md3.set(2,0,0)
                @md3.set(2,1,0)

                (@md2-@md1).to_s.should eq(@md3.to_s)
        end
        it " # Multiplicar dos matrices " do
                @md4 = MatrixDdLppT16::Matriz_Dispersa.new(2,3)
                @md4.set(1,0,-1)
                @md4.set(1,1,-1)
                @md4.set(1,2,0)

                @md3 = MatrixDdLppT16::Matriz_Dispersa.new(3,3)
                @md3.set(0,0,0)
                @md3.set(0,1,0)
                @md3.set(0,2,0)

                @md3.set(1,0,-3)
                @md3.set(1,1,-3)
                @md3.set(1,2,0)

                @md3.set(2,0,0)
                @md3.set(2,1,0)
                @md3.set(2,2,0)

                (@md1*@md4).to_s.should eq(@md3.to_s)
        end
    end
    

    describe " # max y min " do
        it " # Maximo de una matriz dispersa" do
                @md1.max.should == 3
        end
        it " # Minimo de una matriz dispersa" do
                @m1.min.should == 0
        end
    end


end
