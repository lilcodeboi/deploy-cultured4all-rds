# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# Given these are credentials, security of the values should be considered.
# ---------------------------------------------------------------------------------------------------------------------
variable "region" {
  description = "The AWS region to deploy to"
  type        = string
}

variable "username" {
  description = "Master username of the DB"
  type        = string
}

variable "password" {
  description = "Master password of the DB"
  type        = string
}

variable "database_name" {
  description = "Name of the database to be created"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "Name of the database"
  type        = string
  default     = "cultured4all-rds"
}

variable "engine_name" {
  description = "Name of the database engine"
  type        = string
  default     = "postgres"
}

variable "family" {
  description = "Family of the database"
  type        = string
  default     = "postgres11"
}

variable "port" {
  description = "Port which the database should run on"
  type        = number
  default     = 5432
}

variable "major_engine_version" {
  description = "MAJOR.MINOR version of the DB engine"
  type        = string
  default     = "11"
}

variable "engine_version" {
  description = "Version of the database to be launched"
  default     = "11.10"
  type        = string
}

variable "allocated_storage" {
  description = "Disk space to be allocated to the DB instance"
  type        = number
  default     = 5
}

variable "license_model" {
  description = "License model of the DB instance"
  type        = string
  default     = "general-public-license"
}

variable "instance_class" {
  description = "Instance class to be used to run the database"
  type        = string
  default     = "db.t2.micro"
}