require 'etc'
Facter.add("userdirs") do
  setcode do
    result = ''
    File.open("/etc/passwd", 'r') do |f|
      f.each_line do |line|
        user = line.match(/^[^:]+/).to_s
        homedir = Etc.getpwnam(user).dir
        if !result.include? ('/root')
          result += homedir
          result +=','
        end
        if homedir.include? ('/home/')
          result += homedir
          result +=','
        end 
      end
    end
    result
  end
end
