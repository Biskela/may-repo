# ELASTIC IP-ONE
/*resource "aws_eip" "Eip-for-Prod-NGW-1" {
 
  depends_on = [Prod-IGW.Prod-Vpc_id]
}



# ELASTIC IP-TWO
resource "aws_eip" "Eip-for-Prod-NGW-2" {
 
  depends_on = [Prod-IGW.Prod-Vpc_id]
}*/

# ELASTIC IP-ONE
resource "aws_eip" "Eip-for-Prod-NGW" {
  tags = {
    Name = "Eip-for-Prod-NGW"
  }
}


# ELASTIC IP-TWO
/*resource "aws_eip" "Eip-for-Prod-NGW-2" {
  tags = {
    Name = "Eip-for-Prod-NGW-2"
  }
*/

