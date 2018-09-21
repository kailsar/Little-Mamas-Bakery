
resource "aws_elasticache_subnet_group" "EC_subnet_group" {
    subnet_ids = ["${aws_subnet.private_subnet.*.id}"]
    name = "${var.subnet_group_name}"
}

resource "aws_elasticache_replication_group" "default" {
  replication_group_id          = "MamasRedis"
  replication_group_description = "Redis cluster"
 
  node_type            = "cache.t2.micro"
  port                 = 6379
  parameter_group_name = "default.redis4.0.cluster.on"
 
  snapshot_retention_limit = 5
  snapshot_window          = "00:00-05:00"
 
  subnet_group_name = "${aws_elasticache_subnet_group.EC_subnet_group.name}"
 
  automatic_failover_enabled = true
 
  cluster_mode {
    replicas_per_node_group = 1
    num_node_groups         = 1
  }
}

resource "aws_db_instance" "rds_instance" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  multi_az             = true
  name                 = "mamas_rds"
  username             = "admin"
  password             = "9aDrG}GK$>[#E4A"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}