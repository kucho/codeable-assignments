=begin

https://stackoverflow.com/questions/21372649/what-is-the-difference-between-integer-and-fixnum/21411269#21411269

UPDATE: As of Ruby 2.4, the Fixnum and Bignum classes are gone, there is only Integer. The exact same optimizations still exist, but they are treated as "proper" compiler optimizations, i.e. behind the scenes, invisible to the programmer.

This is somewhat confusing. Integer is the real class that you should think about. Fixnum is basically a performance optimization that should never have been made visible to the programmer in the first place. (Compare this with flonums in YARV, which are implemented entirely as an optimization inside the VM, and never exposed to the programmer.)

Basically, Fixnums are fast and Bignums are slow(er), and the implementation automatically switches back and forth between them. You never ask for one of those directly, you will just get one or the other, depending on whether your integer fits into the restricted size of a Fixnum or not.

=end