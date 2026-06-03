
resource "local_file" "myfile" {
    filename = "file-${var.POLICY_NUMBER}"
    content = "dupa"
}