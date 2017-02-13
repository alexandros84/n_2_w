module N2W
class Spint
  def self.one(x, s=" ")
a=x.to_s.split("")
a.map! { |x| x.to_i }
one={0=>"zero",1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 8=>"eight", 9=>"nine"}
two_i={1=>"eleven", 2=>"twelve", 3=>"thirteen", 4=>"fourteen", 5=>"fifteen", 6=>"sixteen", 7=>"seventeen", 8=>"eighteen", 9=>"nineteen"}
two_r={1=>"ten",2=>"twenty",3=>"thirty",4=>"forty",5=>"fifty",6=>"sixty",7=>"seventy",8=>"eighty",9=>"ninety"}
tn=Proc.new do	if a[-1]==0
			        two_r[a[-2]]
			elsif a[-2]==1
				    two_i[a[-1]]
			else
				    two_r[a[-2]]+s+one(a[-1])
			end
		        end
if    a.length==1 
            return one[a[-1]]
elsif a.length==2 
    if a[-1]==0 && a[-2]==0
        return "zero"
    elsif a[-2]==0 && a[-1]!=0
        return one[a[-1]]
    else
		return	tn.call
	end
elsif a.length==3
    if (a[-3]!=0) 			
    	if a[-2]!=0 
    		return (one[a[-3]]+" hundred and "+tn.call)
    	elsif a[-2]==0 && a[-1]!=0
		    return one[a[-3]]+" hundred and "+one[a[-1]]
		else 
    		return one[a[-3]]+" hundred"
    	end
    elsif (a[-3]==0 && a[-2]!=0)
    			return tn.call
    elsif (a[-3]==0 && a[-2]==0 && a[-1]==0)
    			return ""
    elsif (a[-3]==0 && a[-2]==0 && a[-1]!=0)
    			return one[a[-1]]   
end
end
end

def self.any_other(x, s=" ")
ab=x.to_s.split("")
order={0=>"", 1=>" thousand ", 2=>" million ", 3=>" billion ", 4=>" trillion ", 5=>" quadrillion ", 6=>" quintillion ", 7=>" sextillion ", 8=>" septillion ", 9=>" octillion ", 10=>" nonillion ", 11=>" decillion ", 12=>" undecillion ", 13=>" duodecillion ", 14=>" tredecillion ", 15=>" quattuordecillion ", 16=>" quindecillion "  }
b=[ab.reverse.each_slice(3).to_a]
v=0
b[0].reverse.each_with_index {|x,y| v=y if (x[-1]!="0" || x[-2]!="0" || x[-3]!="0")}
va=b[0].reverse[v]
((va[-1]=="0" || va[-2]=="0") && va[-3]!="0") ? q="and " : q=""
e=b[0].map! {|x| x.join.reverse }
e.map!.with_index{|x,y| x=="000" ? one(x) : one(x)+order[y]}
z=(e.reverse-[""])
z.map! {|x| (x.include? "zero") ? x="" : x }
aza=z.insert(-2,q).join.split(" ")
if aza[0]=="and" then aza.delete("and") end 
aza.join(" ")
end
  
end
end 