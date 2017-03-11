for teste in t01 t02 t03
do
echo $teste
bn < $teste.in | diff - $teste.out
done