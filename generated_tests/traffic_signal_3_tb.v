`timescale 1ns/1ps

module tb_traffic_signal;

reg clk;
wire [2:0] light;

// Instantiate the Unit Under Test (UUT)
traffic_signal uut (
    .clk(clk),
    .light(light)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize state
    #0;

    // Wait for a few clock cycles to observe the output
    #10;
    if (light !== 3'b100) begin
        $display("FAIL: Initial light state is not RED");
        $finish;
    end

    #10;
    if (light !== 3'b010) begin
        $display("FAIL: Light state is not GREEN after 1 clock cycle");
        $finish;
    end

    #10;
    if (light !== 3'b001) begin
        $display("FAIL: Light state is not YELLOW after 2 clock cycles");
        $finish;
    end

    #10;
    if (light !== 3'b100) begin
        $display("FAIL: Light state is not RED after 3 clock cycles");
        $finish;
    end

    // Continue testing for a few more cycles
    #10;
    if (light !== 3'b010) begin
        $display("FAIL: Light state is not GREEN after 4 clock cycles");
        $finish;
    end

    #10;
    if (light !== 3'b001) begin
        $display("FAIL: Light state is not YELLOW after 5 clock cycles");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule