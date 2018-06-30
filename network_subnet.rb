#Author : nkatwesigye@gmail.com
# expose  system subnet information 
# 01-22-18

require "date"

if Facter.value(:osfamily) != 'windows'
Facter.add('network_subnet') do

if Facter.value(:os)['name'] == 'Ubuntu'

       str= %x[ip route | head -n1 | cut -f1 -d " " ]
else
       str= %x[ip route | head -n1 | cut -f1 -d " " ]
end

if  str.to_s.empty?

   network = 'not_set'
else
  network = str
end
  setcode do

    str
  end
   end
end
