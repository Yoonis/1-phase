A = 1
$a = 2
a = 3

def method_a(a)
  $a += 2
  p A + $a + a
end

# method_a(a)
# => 1 + 4 + 3 = 8

class Example
  @@a = 4

  def initialize(a)
    @a = a
  end

  def method_a(a)
    @a += 1
    @@a += 2
    $a += 3
    p @a + @@a + A + $a + a
  end
end

a = 6
example1 = Example.new(a)
# => Example object with @a = 6

a = 7
example2 = Example.new(a)
# => Example object with @a = 7

example1.method_a(a)
# => @a = 7, @@a = 6, A = 1, $a = 5, a = 7
# => 7 + 6 + 1 + 5 + 7 = 26

example2.method_a(a)
# => @a = 8, @@a = 8, A = 1, $a = 8, a = 7
# => 8 + 8 + 1 + 8 + 7 = 32

a = 3

example1.method_a(a)
# => @a = 8, @@a = 10, A = 1, $a = 11, a = 3
# => 8 + 10 + 1 + 11 + 3 = 33

example2.method_a(a)
# => @a = 9, @@a = 12, A = 1, $a = 14, a = 3
# => 9 + 12 + 1 + 14 + 3 = 39