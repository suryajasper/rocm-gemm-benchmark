sudo pkill -f gemm-bench

cd third_party/llvm-project
# cmake -G Ninja -B ./build/ -S llvm -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="mlir;clang"
cmake --build build
cd ../../

cd src/ireekernels
# cmake -G Ninja -B ../ireekernelsbuild
cmake --build ../ireekernelsbuild
cd ../../

CXX=hipcc meson setup build --reconfigure
cd build && sudo ninja && cd -

python3 -m venv rocm_gemm_venv
source rocm_gemm_venv/bin/activate
pip install -r gemmbench/requirements.txt

for device in $(seq 6 7); do (build/gemm-bench --device=$device &); done
./gb run