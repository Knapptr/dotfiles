return {
    -- test block
    s("tb", fmt([=[#[cfg(test)]
#[test]
fn {}(){{

}}
    ]=], { i(1, "test_name") })),
    -- test
    s("tt", fmt([=[#[test]
fn {}(){{

}} ]=], { i(1, "test_name") })),
    -- Leet Code solution
    s("leet", fmt([=[
use crate::solution::Solution;
impl Solution{{
}}
    ]=], {}))
}
