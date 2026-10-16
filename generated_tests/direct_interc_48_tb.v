`timescale 1ns/1ps

module tb_direct_interc;

//----- INPUT PORTS -----
reg [0:0] in;

//----- OUTPUT PORTS -----
wire [0:0] out;

//----- Instantiate the Unit Under Test (UUT) -----
direct_interc uut (
    .in(in),
    .out(out)
);

//----- Test Sequence -----
initial begin
    // Initialize input
    in = 1'b0;

    // Wait for a short time and check output
    #10;
    if (out !== 1'b0) begin
        $display("FAIL: Output should be 0 when input is 0");
        $finish;
    end

    // Change input to 1
    in = 1'b1;
    #10;
    if (out !== 1'b1) begin
        $display("FAIL: Output should be 1 when input is 1");
        $finish;
    end

    // Change input back to 0
    in = 1'b0;
    #10;
    if (out !== 1'b0) begin
        $display("FAIL: Output should be 0 when input is 0");
        $finish;
    end

    // Final check
    in = 1'b1;
    #10;
    if (out !== 1'b1) begin
        $display("FAIL: Output should be 1 when input is 1");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule