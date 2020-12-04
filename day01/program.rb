magic_num = 2020
nums = File.readlines('input').map { |line| line.to_i }
nums.each_with_index do |num1, i|
  (i+1).upto(nums.length-1).each do |j|
    num2 = nums[j]
    (j+1).upto(nums.length-1).each do |k|
      num3 = nums[k]
      if num1 + num2 + num3 == magic_num
        puts num1, num2, num3, num1*num2*num3
        exit
      end
    end
  end
end
