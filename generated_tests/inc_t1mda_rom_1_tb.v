`timescale 1ns/1ps

module tb_inc_t1mda_rom;

reg [3:0] nx_incfunc_rom;
wire [1:0] t1mda_rom;

// Instantiate the module under test
inc_t1mda_rom uut (
    .nx_incfunc_rom(nx_incfunc_rom),
    .t1mda_rom(t1mda_rom)
);

initial begin
    // Test cases
    // Test case 1: nx_incfunc_rom = 4'b0000
    nx_incfunc_rom = 4'b0000; #10;
    if (t1mda_rom !== 2'h2) begin
        $display("FAIL: Expected 2'h2 for input 4'b0000, got %b", t1mda_rom);
        $finish;
    end

    // Test case 2: nx_incfunc_rom = 4'b1011
    nx_incfunc_rom = 4'b1011; #10;
    if (t1mda_rom !== 2'h2) begin
        $display("FAIL: Expected 2'h2 for input 4'b1011, got %b", t1mda_rom);
        $finish;
    end

    // Test case 3: nx_incfunc_rom = 4'b0010
    nx_incfunc_rom = 4'b0010; #10;
    if (t1mda_rom !== 2'h1) begin
        $display("FAIL: Expected 2'h1 for input 4'b0010, got %b", t1mda_rom);
        $finish;
    end

    // Test case 4: nx_incfunc_rom = 4'b0100
    nx_incfunc_rom = 4'b0100; #10;
    if (t1mda_rom !== 2'h1) begin
        $display("FAIL: Expected 2'h1 for input 4'b0100, got %b", t1mda_rom);
        $finish;
    end

    // Test case 5: nx_incfunc_rom = 4'b0101
    nx_incfunc_rom = 4'b0101; #10;
    if (t1mda_rom !== 2'h3) begin
        $display("FAIL: Expected 2'h3 for input 4'b0101, got %b", t1mda_rom);
        $finish;
    end

    // Test case 6: nx_incfunc_rom = 4'b0001
    nx_incfunc_rom = 4'b0001; #10;
    if (t1mda_rom !== 2'h0) begin
        $display("FAIL: Expected 2'h0 for input 4'b0001, got %b", t1mda_rom);
        $finish;
    end

    // Test case 7: nx_incfunc_rom = 4'b0110
    nx_incfunc_rom = 4'b0110; #10;
    if (t1mda_rom !== 2'h0) begin
        $display("FAIL: Expected 2'h0 for input 4'b0110, got %b", t1mda_rom);
        $finish;
    end

    // Test case 8: nx_incfunc_rom = 4'b1010
    nx_incfunc_rom = 4'b1010; #10;
    if (t1mda_rom !== 2'h0) begin
        $display("FAIL: Expected 2'h0 for input 4'b1010, got %b", t1mda_rom);
        $finish;
    end

    // Test case 9: nx_incfunc_rom = 4'b1000
    nx_incfunc_rom = 4'b1000; #10;
    if (t1mda_rom !== 2'h0) begin
        $display("FAIL: Expected 2'h0 for input 4'b1000, got %b", t1mda_rom);
        $finish;
    end

    // Test case 10: nx_incfunc_rom = 4'b1111 (default case)
    nx_incfunc_rom = 4'b1111; #10;
    if (t1mda_rom !== 2'hx) begin
        $display("FAIL: Expected 2'hx for input 4'b1111, got %b", t1mda_rom);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule