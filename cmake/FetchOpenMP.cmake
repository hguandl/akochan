set(OPENMP_STANDALONE_BUILD ON)
set(LIBOMP_ENABLE_SHARED OFF)

include(FetchContent)
FetchContent_Declare(
    LocalOpenMP
    URL      https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.1/openmp-13.0.1.src.tar.xz
    URL_HASH SHA256=6b79261371616c31fea18cd3ee1797c79ee38bcaf8417676d4fa366a24c96b4f
)
FetchContent_MakeAvailable(LocalOpenMP)
