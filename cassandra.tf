module "cassandra" 
{
    source  = "cassandra/"
    subnetwork = "${google_compute_subnetwork.dev-sub-west1.self_link}"
    ip = "10.1.0.15"
}

