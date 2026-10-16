`timescale 1ns/1ps

module tb_inc_l1md_rom;

reg [3:0] nx_incfunc_rom;
wire [1:0] l1md_rom;

// Instantiate the module under test
inc_l1md_rom uut (
    .l1md_rom(l1md_rom),
    .nx_incfunc_rom(nx_incfunc_rom)
);

initial begin
    // Test cases
    // Test case 1: nx_incfunc_rom = 4'b0001
    nx_incfunc_rom = 4'b0001; #10;
    if (l1md_rom !== 2'h1) begin
        $display("FAIL: Expected l1md_rom = 2'h1 for nx_incfunc_rom = 4'b0001");
        $finish;
    end

    // Test case 2: nx_incfunc_rom = 4'b1000
    nx_incfunc_rom = 4'b1000; #10;
    if (l1md_rom !== 2'h1) begin
        $display("FAIL: Expected l1md_rom = 2'h1 for nx_incfunc_rom = 4'b1000");
        $finish;
    end

    // Test case 3: nx_incfunc_rom = 4'b0010
    nx_incfunc_rom = 4'b0010; #10;
    if (l1md_rom !== 2'h2) begin
        $display("FAIL: Expected l1md_rom = 2'h2 for nx_incfunc_rom = 4'b0010");
        $finish;
    end

    // Test case 4: nx_incfunc_rom = 4'b0011
    nx_incfunc_rom = 4'b0011; #10;
    if (l1md_rom !== 2'h3) begin
        $display("FAIL: Expected l1md_rom = 2'h3 for nx_incfunc_rom = 4'b0011");
        $finish;
    end

    // Test case 5: nx_incfunc_rom = 4'b0000
    nx_incfunc_rom = 4'b0000; #10;
    if (l1md_rom !== 2'h0) begin
        $display("FAIL: Expected l1md_rom = 2'h0 for nx_incfunc_rom = 4'b0000");
        $finish;
    end

    // Test case 6: nx_incfunc_rom = 4'b0100
    nx_incfunc_rom = 4'b0100; #10;
    if (l1md_rom !== 2'h0) begin
        $display("FAIL: Expected l1md_rom = 2'h0 for nx_incfunc_rom = 4'b0100");
        $finish;
    end

    // Test case 7: nx_incfunc_rom = 4'b0110
    nx_incfunc_rom = 4'b0110; #10;
    if (l1md_rom !== 2'h0) begin
        $display("FAIL: Expected l1md_rom = 2'h0 for nx_incfunc_rom = 4'b0110");
        $finish;
    end

    // Test case 8: nx_incfunc_rom = 4'b1010
    nx_incfunc_rom = 4'b1010; #10;
    if (l1md_rom !== 2'h0) begin
        $display("FAIL: Expected l1md_rom = 2'h0 for nx_incfunc_rom = 4'b1010");
        $finish;
    end

    // Test case 9: nx_incfunc_rom = 4'b1111 (default case)
    nx_incfunc_rom = 4'b1111; #10;
    if (l1md_rom !== 2'hx) begin
        $display("FAIL: Expected l1md_rom = 2'hx for nx_incfunc_rom = 4'b1111");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule