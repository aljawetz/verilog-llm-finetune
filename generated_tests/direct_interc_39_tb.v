`timescale 1ns/1ps

module tb_direct_interc;

//----- INPUT PORTS -----
reg [0:0] in;

//----- OUTPUT PORTS -----
wire [0:0] out;

// Instantiate the module under test (uut)
direct_interc uut (
    .in(in),
    .out(out)
);

// Test sequence
initial begin
    // Initialize input
    in = 1'b0;
    
    // Wait for some time
    #10;
    
    // Check output
    if (out !== 1'b0) begin
        $display("FAIL: Output should be 0 when input is 0");
        $finish;
    end
    
    // Change input
    in = 1'b1;
    
    // Wait for some time
    #10;
    
    // Check output
    if (out !== 1'b1) begin
        $display("FAIL: Output should be 1 when input is 1");
        $finish;
    end
    
    // Final check
    in = 1'b0;
    #10;
    if (out !== 1'b0) begin
        $display("FAIL: Output should be 0 when input is reset to 0");
        $finish;
    end
    
    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule