require 'nmax_bula3_1992/version'
require 'io/console'

module NmaxBula31992
  class Error < StandardError
  end

  class Node
    attr_reader :value
    attr_accessor :left, :right
    def initialize(value)
      @value = value.clone
      @left = nil #Меньше value
      @right = nil #Больше или равно value
    end
  end

  def self.pushNode(node, value)
    if compare(node.value, value) >= 0
      if(node.right)
        pushNode(node.right, value)
      else
        node.right = Node.new(value)
      end
    else
      if(node.left)
        pushNode(node.left, value)
      else
        node.left = Node.new(value)
      end
    end
  end

  def self.compare(a, b) #функция сравнения current_chislo с n элементом массива result_array
    if a.length > b.length
      1
    elsif a.length < b.length
      -1
    else #a & b одинаковой длины
      for i in 1..a.length
        if a[i-1] > b[i-1]
          return 1
        elsif a[i-1] < b[i-1]
          return -1
        end
      end
      return 0
    end
  end

  def self.traverse(node)
    return if node.nil?
    traverse(node.left) if node.left
    puts node.value.to_s
    traverse(node.right) if node.right
  end

  result_array = []
  current_chislo = []
  root = nil
  # Your code goes here...
  chislo_flag = true #устанавливаем первоначальный флаг правда
  while letter = $stdin.getc
    if letter == ' ' #слово кончилось
      if chislo_flag #все слово целиком состоит из цифр
        if root.nil?
          root = Node.new(current_chislo)
        else
          pushNode(root, current_chislo)
        end
      end #конец проверки слова
      current_chislo.clear #очищаем текущее слово для нового
      chislo_flag = true #переустанавливаем первоначальный флаг правда
    elsif (chislo_flag == true) && %w[0 1 2 3 4 5 6 7 8 9].include?(letter) #буква является цифрой
      current_chislo.push letter #сохраняем цифру в массив текущего слова, оно не может быть больше 1000 символов
    else #не цифра снимаем флаг, больше это слово не проверяем
      chislo_flag = false #ничего не делаем
    end #конец проверки букв
  end #конец входного потока
  puts "Hello! I'm Ruby!"

  traverse(root)
  n = ARGV[0]
end
