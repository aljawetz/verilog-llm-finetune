`timescale 1ns/1ps

module tb_Sqrt_add;

reg [19:0] coeffs_Sqrt;
reg [19:0] x_f_D0;
wire [20:0] y_f;

// Instantiate the module under test (uut)
Sqrt_add uut (
    .coeffs_Sqrt(coeffs_Sqrt),
    .x_f_D0(x_f_D0),
    .y_f(y_f)
);

// Test procedure
initial begin
    // Test case 1
    coeffs_Sqrt = 20'd5; 
    x_f_D0 = 20'd10; 
    #10;
    if (y_f !== 21'd15) begin
        $display("FAIL: Test case 1 failed, expected 15 but got %d", y_f);
        $finish;
    end

    // Test case 2
    coeffs_Sqrt = 20'd0; 
    x_f_D0 = 20'd20; 
    #10;
    if (y_f !== 21'd20) begin
        $display("FAIL: Test case 2 failed, expected 20 but got %d", y_f);
        $finish;
    end

    // Test case 3
    coeffs_Sqrt = 20'd20; 
    x_f_D0 = 20'd0; 
    #10;
    if (y_f !== 21'd20) begin
        $display("FAIL: Test case 3 failed, expected 20 but got %d", y_f);
        $finish;
    end

    // Test case 4
    coeffs_Sqrt = 20'd15; 
    x_f_D0 = 20'd15; 
    #10;
    if (y_f !== 21'd30) begin
        $display("FAIL: Test case 4 failed, expected 30 but got %d", y_f);
        $finish;
    end

    // Test case 5
    coeffs_Sqrt = 20'd1048575; 
    x_f_D0 = 20'd1048575; 
    #10;
    if (y_f !== 21'd2097150) begin
        $display("FAIL: Test case 5 failed, expected 2097150 but got %d", y_f);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule