`timescale 1ns/1ps

module tb_mux_8to1_case;

reg [7:0] d_in;
reg [2:0] sel_in;
wire y_out;

// Instantiate the module under test (uut)
mux_8to1_case uut (
    .d_in(d_in),
    .sel_in(sel_in),
    .y_out(y_out)
);

initial begin
    // Test case 1: Select input 0
    d_in = 8'b10101010; // Input data
    sel_in = 3'b000;    // Select line
    #10;
    if (y_out !== d_in[0]) begin
        $display("FAIL: Test case 1 failed, expected %b but got %b", d_in[0], y_out);
        $finish;
    end

    // Test case 2: Select input 1
    sel_in = 3'b001;    
    #10;
    if (y_out !== d_in[1]) begin
        $display("FAIL: Test case 2 failed, expected %b but got %b", d_in[1], y_out);
        $finish;
    end

    // Test case 3: Select input 2
    sel_in = 3'b010;    
    #10;
    if (y_out !== d_in[2]) begin
        $display("FAIL: Test case 3 failed, expected %b but got %b", d_in[2], y_out);
        $finish;
    end

    // Test case 4: Select input 3
    sel_in = 3'b011;    
    #10;
    if (y_out !== d_in[3]) begin
        $display("FAIL: Test case 4 failed, expected %b but got %b", d_in[3], y_out);
        $finish;
    end

    // Test case 5: Select input 4
    sel_in = 3'b100;    
    #10;
    if (y_out !== d_in[4]) begin
        $display("FAIL: Test case 5 failed, expected %b but got %b", d_in[4], y_out);
        $finish;
    end

    // Test case 6: Select input 5
    sel_in = 3'b101;    
    #10;
    if (y_out !== d_in[5]) begin
        $display("FAIL: Test case 6 failed, expected %b but got %b", d_in[5], y_out);
        $finish;
    end

    // Test case 7: Select input 6
    sel_in = 3'b110;    
    #10;
    if (y_out !== d_in[6]) begin
        $display("FAIL: Test case 7 failed, expected %b but got %b", d_in[6], y_out);
        $finish;
    end

    // Test case 8: Select input 7 (default case)
    sel_in = 3'b111;    
    #10;
    if (y_out !== d_in[7]) begin
        $display("FAIL: Test case 8 failed, expected %b but got %b", d_in[7], y_out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule