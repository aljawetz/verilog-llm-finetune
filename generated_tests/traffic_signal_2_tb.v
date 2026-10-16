`timescale 1ns/1ps

module tb_traffic_signal;

reg clk;
wire [2:0] light;

// Instantiate the unit under test (uut)
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
    // Wait for a few clock cycles to observe the initial state
    #10;

    // Check the initial state
    if (light !== 3'b100) begin
        $display("FAIL: Initial light state is not RED");
        $finish;
    end

    // Wait for the next state
    #10; // After 1 clock cycle
    if (light !== 3'b010) begin
        $display("FAIL: Light state is not GREEN after RED");
        $finish;
    end

    // Wait for the next state
    #10; // After 2 clock cycles
    if (light !== 3'b001) begin
        $display("FAIL: Light state is not YELLOW after GREEN");
        $finish;
    end

    // Wait for the next state
    #10; // After 3 clock cycles
    if (light !== 3'b100) begin
        $display("FAIL: Light state is not RED after YELLOW");
        $finish;
    end

    // Wait for one more cycle to confirm the cycle repeats
    #10; // After 4 clock cycles
    if (light !== 3'b010) begin
        $display("FAIL: Light state is not GREEN after RED again");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule