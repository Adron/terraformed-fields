module "cassandra_node_one" 
{
    source  = "cassandra/"
    
    // The core variables needed for the node creation.
    node_name = "charlie"
    node_subnetwork = "${google_compute_subnetwork.dev-sub-west1.self_link}"

    // The internal IP address specifically.
    node_address_name = "theaddyname"
    node_ip = "10.1.0.15"
}

module "cassandra_node_two" 
{
    source  = "cassandra/"
    
    // The core variables needed for the node creation.
    node_name = "sally"
    node_subnetwork = "${google_compute_subnetwork.dev-sub-west1.self_link}"

    // The internal IP address specifically.
    node_address_name = "thesecondaddyname"
    node_ip = "10.1.0.14"
}

