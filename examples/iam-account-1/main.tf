# Create the first IAM account 

data "aws_iam_policy_document" "assume_role"{ 
    statement {
      actions = [
        "sts.AssumeRole",
      ]
      principals {
        type = "AWS"
        identifiers = "" # Master Account User
      }
    }

      effect = "Allow"
}

resource "aws_iam_role" "default"{ 
  name = "Account-1"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  description = "Testing Account one"
  
}