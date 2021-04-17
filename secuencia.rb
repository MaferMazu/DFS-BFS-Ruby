class Secuencia
    attr_accessor :list

    def initialize(*args)
        @list = args
    end
  
    def agregar(x)
        @list.append(x)
    end

    def remover
        @list.pop()
    end

    def vacio
        @list.empty?
    end

    def to_s
        puts "#{@list}"
        "#{@list}"
    end
end

class Pila < Secuencia
    def remover()
        @list.pop()
    end
end

class Cola < Secuencia
    def remover()
        @list.shift()
    end
end

# Ejemplo:
# pila=Pila.new(1,2,3,4)
# cola=Cola.new(1,2,3,4)
# puts "Pila"
# pila.to_s
# puts "Cola"
# cola.to_s
# puts "Remuevo de cola"
# cola.remover()
# puts "Remuevo de pila"
# pila.remover()
# puts "Pila"
# pila.to_s
# puts "Cola"
# cola.to_s

