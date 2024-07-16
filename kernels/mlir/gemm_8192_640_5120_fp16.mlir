module {
  func.func @main_0(%arg0: tensor<8192x640xf16>, %arg1: tensor<640x5120xf16>) -> tensor<8192x5120xf16> {
    %cst = arith.constant 0.000000e+00 : f16
    %0 = tensor.empty() : tensor<8192x5120xf16>
    %1 = linalg.fill ins(%cst : f16) outs(%0 : tensor<8192x5120xf16>) -> tensor<8192x5120xf16>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<8192x640xf16>, tensor<640x5120xf16>) outs(%1 : tensor<8192x5120xf16>) -> tensor<8192x5120xf16>
    return %2 : tensor<8192x5120xf16>
  }
}
