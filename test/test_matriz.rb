require "./lib/matrix_dd_lpp_t16.rb"
require "test/unit"

class Test_Matriz < Test::Unit::TestCase

        def test_1

                @m1 = MatrixDdLppT16::Matriz_Densa.new(2,2)
                @m2 = MatrixDdLppT16::Matriz_Densa.new(2,2)
                @m3 = MatrixDdLppT16::Matriz_Densa.new(2,2)
        
                @m1.set(0,0,1)
                @m1.set(0,1,2)
                @m1.set(1,0,3)
                @m1.set(1,1,4)
                
                @m2.set(0,0,5)
                @m2.set(0,1,6)
                @m2.set(1,0,7)
                @m2.set(1,1,8)

                @m3.set(0,0,6)
                @m3.set(0,1,8)
                @m3.set(1,0,10)
                @m3.set(1,1,12)

                assert_equal(@m3.to_s,(@m1+@m2).to_s)
        end

        def test_2

                @md1 = MatrixDdLppT16::Matriz_Dispersa.new(2,2)
                @md2 = MatrixDdLppT16::Matriz_Dispersa.new(2,2)
                @md3 = MatrixDdLppT16::Matriz_Dispersa.new(2,2)

                @md1.set(0,0,0)
                @md1.set(0,1,0)
                @md1.set(1,0,5)
                @md1.set(1,1,0)

                @md2.set(0,0,0)
                @md2.set(0,1,0)
                @md2.set(1,0,3)
                @md2.set(1,1,0)

                @md3.set(0,0,0)
                @md3.set(0,1,0)
                @md3.set(1,0,2)
                @md3.set(1,1,0)

                assert_equal(@md3.to_s,(@md1-@md2).to_s)

        end
end
