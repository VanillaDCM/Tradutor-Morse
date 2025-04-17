require 'colorize'
require 'csv'

class GeradorSenhas
    def initialize(qtde, tamanho, usar_maiusculas, usar_minusculas, usar_numeros, usar_simbolos)
        @qtde = qtde 
        @tamanho = tamanho
        @usar_maiusculas = usar_maiusculas
        @usar_minusculas = usar_minusculas
        @usar_numeros = usar_numeros
        @usar_simbolos = usar_simbolos
    end

    def gerar_caracteres
        chars = []
        chars += ('A'..'Z').to_a if @usar_maiusculas
        chars += ('a'..'z').to_a if @usar_minusculas
        chars += (0..9).to_a.map(&:to_s) if @usar_numeros
        chars += %w[! @ # $ % & *] if @usar_simbolos
        chars
    end

    def gerar_senhas
        caracteres = gerar_caracteres
        raise "Nenhum conjunto de caracteres selecionado!.".red if caracteres.empty?
            
        Array.new(@qtde) do
            Array.new(@tamanho){caracteres.sample}.join
        end
    end

    def exportar_cvs(nome_arquivo = "Senha_geradas.csv")
        senhas = gerar_senhas
        CSV.open(nome_arquivo, "w") do |csv| 
            csv << ["senha"] 
            senhas.each {|senha| csv << [senha]}
    end
        puts "Senhas salvas em '#{nome_arquivo}' com sucesso!".green
    end
end

puts " \n==== Gerador de Senhas ==== ".blue
print "\n Quantas senhas você quer?: ".cyan
qtde = gets.chomp.to_i
print "Tamanho de cada senha: ".cyan
tamanho = gets.chomp.to_i

print "Incluir letras Maiúsculas? (s/n) ".yellow
maiusculas = gets.chomp.downcase == 's'
print "Incluir Minúsculas? (s/n) ".yellow
minusculas = gets.chomp.downcase == 's'
print "Incluir Números? (s/n) ".yellow
numeros = gets.chomp.downcase == 's'
print "Incluir símbolos? (s/n) ".yellow
simbolos = gets.chomp.downcase == 's'

gerador = GeradorSenhas.new(qtde, tamanho, maiusculas, minusculas, simbolos, numeros)
gerador.exportar_cvs
