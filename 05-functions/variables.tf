variable "instance_names" {
    type = list
    default = ["ansible", "linux", "shell"] #count.index
}


variable "common_tags" {
    type = map
    default = {
        Project = "practice"
        Component = "practice-1"
        Environment = "Dev"
        Terraform = "true"
    }
}
