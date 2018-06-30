#Author: nkatwesigye@gmail 
# last logged in information profiling using facter
#Check last logged account across puppet managed systems

if Facter.value(:osfamily) != 'windows'
Facter.add('last_loggedin') do
  last_loggedin_result = \
  Facter::Core::Execution.exec('last -F | head -n 1 | awk \'{print $1,$5, $6, $8 }\'')
  if !last_loggedin_result.nil? && !last_loggedin_result.empty?
     last_loggedin = last_loggedin_result
  else
     last_loggedin = "NO LOGIN INFO"
  end
  setcode do
     last_loggedin
  end
end
end 

