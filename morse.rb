MORSE = {
    'A' => '.-',    'B' => '-...',  'C' => '-.-.', 'D' => '-..',
    'E' => '.',     'F' => '..-.',  'G' => '--.',  'H' => '....',
    'I' => '..',    'J' => '.---',  'K' => '-.-',  'L' => '.-..',
    'M' => '--',    'N' => '-.',    'O' => '---',  'P' => '.--.',
    'Q' => '--.-',  'R' => '.-.',   'S' => '...',  'T' => '-',
    'U' => '..-',   'V' => '...-',  'W' => '.--',  'X' => '-..-',
    'Y' => '-.--',  'Z' => '--..',
    '0' => '-----', '1' => '.----', '2' => '..---','3' => '...--',
    '4' => '....-', '5' => '.....', '6' => '-....','7' => '--...',
    '8' => '---..', '9' => '----.',
    ' ' => '/'
  }

  INVERSE = MORSE.invert

  def encode_to_morse(txt)
    txt.upcase.chars.map{|chars|MORSE[chars] || '?'}.join(' ')

  end

  def decode_to_morse(morse)
    morse.split(' ').map{|code| INVERSE[code] || '?'}.join('')

  end

def menu 
    puts "========= TRADUTOR DE MORSE ========="

    loop do 
        puts "\nEscolha uma opção:"
        puts "1. Texto para Morse"
        puts "2. Morse para Texto"
        puts "3. Sair"
        print "Opção: "

        choice = gets.chomp

        case choice
        when "1"
            puts "\nDigite o texto: "
            texto = gets.chomp
            puts "Morse: #{encode_to_morse(texto)}"
        
        when "2"
            puts "\nDigite o código a traduzir: "
            morse = gets.chomp
            puts "Texto: #{decode_to_morse(morse)}"

        when "3"
            puts "\nPrograma encerrado!"
            break
        else 
            puts "Codigo não identificado, tente novamente."      

        end
    end 
end

menu