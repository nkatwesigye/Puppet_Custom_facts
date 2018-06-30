#Author: nkatwesigye@gmail.comm
#Parse osversion with minor release e.g centos 6.5i
# Creates a puppet fact to be used drive decisions in puppet manifests .

if Facter.value(:osfamily) != 'windows'
Facter.add('osversion') do
 if Facter.value(:osfamily) == "Debian"
    os =  Facter.value(:operatingsystem)
    version =  Facter.value(:operatingsystemmajrelease)
    osversion = os+" "+version
 else
   os  = Facter.value(:operatingsystem)
   version =  Facter.value(:operatingsystemmajrelease)
   minor = Facter.value(:lsbminordistrelease)
   osversion = os+" "+version+'.'+minor
 end
  setcode do
   osversion
  end
end
end
