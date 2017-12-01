/**
 * Just an async function
 * 
 * @async
 */
(async () => {
  console.log('whatever');
})();

/**
 * AsyncTest
 * @async
 */
class AsyncTest {

  /**
   * Whatever async function ...
   * 
   * @async
   * @returns {Promise<void>}
   */
  async asyncMethod() {
    await doSomething();
  }
  
  
  
  
}
module.exports = AsyncTest;