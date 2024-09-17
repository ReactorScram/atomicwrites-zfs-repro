use atomicwrites::{AtomicFile, OverwriteBehavior};

fn main() {
    let path = "nothing.txt";
    
    std::fs::remove_file(path).ok();
    let file = AtomicFile::new(path, OverwriteBehavior::DisallowOverwrite);
    file.write(|_| Ok::<_, std::io::Error>(())).unwrap();
    println!("Test succeeded");
}
