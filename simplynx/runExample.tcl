# nx example
# sources: https://next-scripting.org/xowiki/file/docs/nx/examples/per-object-mixins.html?html-content=1

nx::Class create BaseClass {
  :public method speak {} {
    puts "Hello from BC."
  }
}

nx::Class create DerivedClass -superclass BaseClass {
  :public method speak {} {
    next
    puts "Hello from DC."
  }
}

DerivedClass create o1
o1 speak
