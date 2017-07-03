#include <iostream>

// typedef long int64_t;
#define MAX_POSITION  2000000000
#define MAX_STEP      2000000000
#define MAX_CIRCLE    2100000000

class forg
{
public:
  forg(int64_t step_len, int64_t position, int64_t circle)
    : m_jump_count(0), m_step_len(step_len)
    , m_position(position), m_circle(circle)
    { }

  int64_t jump()
  {
    ++m_jump_count;

    m_position += m_step_len;
    if (m_position >= m_circle)
      m_position = m_position % m_circle;

    return m_position;
  }

  int64_t position() { return m_position; }

  int64_t jump_count() { return m_jump_count; }

private:
  int64_t m_jump_count;
  int64_t m_step_len;
  int64_t m_position;
  int64_t m_circle;
};


int for_match(int64_t position_x, int64_t position_y, int64_t step_x, int64_t setp_y, int64_t line)
{
  if (position_x == position_y || position_x >= MAX_POSITION || position_y >= MAX_POSITION
    || step_x >= MAX_STEP || step_x <= 0 || setp_y >= MAX_STEP || setp_y <= 0
    || line >= MAX_CIRCLE || line <= 0) {
    return -1;
  }

  forg x(position_x, step_x, line);
  forg y(position_y, setp_y, line);

  while(1) {
    x.jump();
    y.jump();

    if (x.position() == y.position())
      break;
  }

  return x.jump_count();
}

int main()
{
  int64_t position_x = 0;
  int64_t position_y = 0;
  int64_t step_x = 0;
  int64_t setp_y = 0;
  int64_t line = 0;

  // std::cin >> position_x >> position_y >> step_x >> setp_y >> line;
  // int64_t ret = for_match(position_x, position_y, step_x, setp_y, line);
  int64_t ret = for_match(1,2,3,4,5);
  if (ret < 0)
    std::cout << "Impossible";
  else
    std::cout << ret;

  return 0;
}