require './secuencia'

class ListaAdyacencia
    attr_accessor :list

    def initialize(n=0)
        @list = Hash.new
        if not n==0
            for i in 1..n
                @list[i]=[]
            end
        end
    end

    def agregar_nodo(nodo)
        @list[nodo]=[]
    end
  
    def agregar_adyacente(nodo, x)
        @list[nodo].append(x)
    end

    def vacio
        @list.empty?
    end

    def to_s
        puts "#{@list}"
        "#{@list}"
    end

end

class Busqueda
    attr_accessor :lista_adyacencia

    def initialize(lista_adyacencia={})

        if lista_adyacencia.is_a?(ListaAdyacencia)
            @lista_adyacencia = lista_adyacencia.list
        else
            @lista_adyacencia = {}
        end
    end

    def buscar(d,h,secuencia=Pila)

        puts "#{secuencia}:"
        if @lista_adyacencia[d].empty? or @lista_adyacencia[h].empty?
            return -1
        end

        count=0
        por_revisar=secuencia.new(@lista_adyacencia[d])
        revisado=[]
        adyacente=1
        while not por_revisar.vacio
            lista=por_revisar.remover
            adyacentes=secuencia.new(*lista)
            while not adyacentes.vacio
                adyacente = adyacentes.remover
                count = count + 1
                if adyacente == h
                    break
                else
                    if not revisado.include?(@lista_adyacencia[adyacente])
                        por_revisar.agregar(@lista_adyacencia[adyacente])
                    end
                end
            end
            revisado.append(lista)
        end
        
        if adyacente == h
            return count
        else
            return -1
        end
    end
end

class DFS < Busqueda

    def buscar(d,h)
        super(d,h,Pila)
    end
end

class BFS < Busqueda

    def buscar(d,h)
        super(d,h,Cola)
    end
end

# Ejemplo

lista_adyacencia = ListaAdyacencia.new(5)
lista_adyacencia.agregar_adyacente(1, 2)
lista_adyacencia.agregar_adyacente(2, 1)
lista_adyacencia.agregar_adyacente(2, 3)
lista_adyacencia.agregar_adyacente(2, 4)
lista_adyacencia.agregar_adyacente(3, 5)
lista_adyacencia.agregar_adyacente(4, 2)

puts "*************"

dfs=DFS.new(lista_adyacencia)
dfs.lista_adyacencia
c=dfs.buscar(1,3)
puts "#{c}"

bfs=BFS.new(lista_adyacencia)
bfs.lista_adyacencia
c=bfs.buscar(1,3)
puts "#{c}"